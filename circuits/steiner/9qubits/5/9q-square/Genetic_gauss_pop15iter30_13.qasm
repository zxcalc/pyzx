// Initial wiring: [6 0 1 2 4 3 5 7 8]
// Resulting wiring: [6 0 1 2 4 3 5 7 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[6];
cx q[8], q[7];
cx q[3], q[8];
cx q[5], q[4];
cx q[7], q[8];
