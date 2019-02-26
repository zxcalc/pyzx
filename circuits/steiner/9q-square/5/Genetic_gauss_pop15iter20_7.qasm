// Initial wiring: [0 1 3 4 2 6 7 5 8]
// Resulting wiring: [0 1 3 4 2 6 7 5 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[7];
cx q[5], q[0];
cx q[5], q[6];
cx q[4], q[7];
cx q[3], q[8];
