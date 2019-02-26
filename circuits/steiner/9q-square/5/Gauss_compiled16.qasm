// Initial wiring: [0 2 1 3 7 5 6 4 8]
// Resulting wiring: [0 2 3 4 7 5 6 1 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[3], q[4];
cx q[1], q[4];
cx q[1], q[4];
cx q[4], q[3];
cx q[4], q[3];
cx q[0], q[1];
cx q[2], q[3];
