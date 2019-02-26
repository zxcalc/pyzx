// Initial wiring: [5 1 2 4 3 0 6 7 8]
// Resulting wiring: [5 1 2 4 3 0 6 7 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[3];
cx q[0], q[1];
cx q[5], q[0];
cx q[3], q[4];
cx q[8], q[7];
