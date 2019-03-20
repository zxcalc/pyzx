// Initial wiring: [0 5 2 3 1 7 4 6 8]
// Resulting wiring: [0 5 2 3 4 7 1 6 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[4], q[3];
cx q[3], q[2];
cx q[1], q[2];
cx q[1], q[4];
cx q[1], q[4];
cx q[1], q[4];
cx q[2], q[1];
cx q[0], q[1];
cx q[7], q[4];
