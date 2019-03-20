// Initial wiring: [0 1 2 7 3 8 6 4 5]
// Resulting wiring: [1 0 3 7 2 8 6 4 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[5], q[4];
cx q[1], q[0];
cx q[4], q[3];
cx q[2], q[3];
cx q[2], q[3];
cx q[2], q[3];
cx q[0], q[5];
cx q[3], q[4];
cx q[6], q[5];
cx q[3], q[8];
cx q[4], q[5];
cx q[3], q[2];
