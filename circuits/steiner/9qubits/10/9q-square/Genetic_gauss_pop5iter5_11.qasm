// Initial wiring: [0 1 2 3 8 5 6 4 7]
// Resulting wiring: [5 1 2 3 8 0 7 4 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[5];
cx q[2], q[1];
cx q[3], q[4];
cx q[6], q[7];
cx q[4], q[7];
cx q[0], q[5];
cx q[0], q[5];
cx q[0], q[5];
cx q[5], q[4];
cx q[6], q[7];
cx q[6], q[7];
cx q[6], q[7];
cx q[2], q[3];
cx q[4], q[7];
