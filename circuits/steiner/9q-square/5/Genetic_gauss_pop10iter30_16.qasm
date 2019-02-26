// Initial wiring: [5 1 2 3 0 4 7 6 8]
// Resulting wiring: [5 1 2 7 0 3 4 6 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[2];
cx q[4], q[7];
cx q[4], q[7];
cx q[4], q[7];
cx q[4], q[3];
cx q[5], q[4];
