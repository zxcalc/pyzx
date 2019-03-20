// Initial wiring: [0 1 2 3 7 4 6 8 5]
// Resulting wiring: [0 1 2 3 6 4 7 8 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[1];
cx q[4], q[7];
cx q[8], q[3];
cx q[6], q[7];
cx q[6], q[7];
cx q[6], q[7];
cx q[0], q[5];
cx q[8], q[7];
