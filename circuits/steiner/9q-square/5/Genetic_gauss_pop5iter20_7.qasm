// Initial wiring: [0 4 2 3 1 5 6 8 7]
// Resulting wiring: [0 5 2 3 1 4 6 8 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[7];
cx q[0], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[6], q[5];
cx q[4], q[3];
cx q[8], q[7];
